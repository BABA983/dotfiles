# 更新所有子模块（更新到追踪分支的最新 commit）
function update-submodules() {
    git submodule update --init --recursive
    git submodule foreach --recursive -q '
        branch="$(git config -f $toplevel/.gitmodules submodule.$name.branch)"
        echo -------- $name: $branch
        if [[ $branch ]]; then
            git reset --hard
            git pull 2> /dev/null
            if [[ $? -ne 0 ]]; then
                git switch master
                git pull
            fi
            git switch $branch
            git pull
        fi
    '
}

# 检查当前迭代分支中哪个子模块已更新（需要更新上游的子模块）
function which-submodule-changed() {
    git submodule foreach -q '
        project_branch="`git -C $toplevel branch --show-current`"
        branch="$(git config -f $toplevel/.gitmodules submodule.$name.branch)"
        if [[ $branch == $project_branch ]];
            then echo $name;
        fi
    '
}

# 查看某个分支中的子模块追踪分支，例如：
# tracking-branch feature/R630 postman-runtime
function tracking-branch() {
    git config --blob $1:.gitmodules submodule.$2.branch
}

function checkport() {
  lsof -t -i:$argv[1]
}

function killport(){
  kill -9 $(checkport $argv[1])
}

function check_tcp_port(){
  lsof -nP -i TCP -s TCP:LISTEN
}

function ide(){
  tmux new-session 'ping  127.0.0.1' \; \
      split-window 'ping  127.0.0.1' \; \
      split-window 'ping  127.0.0.1' \; \
      select-layout even-vertical
}

# export ALL_PROXY="http://$(get-wsl-host-ip):7890"
function get-wsl-host-ip(){
    local host_ip=$(cat /etc/resolv.conf | grep "nameserver" | cut -f 2 -d " ")
    echo $host_ip
}