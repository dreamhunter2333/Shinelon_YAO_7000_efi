#!/bin/bash

function printHeader() {
  echo 'clover downloader'
}

function getGitHubLatestRelease() {
  local repoURL='https://github.com/Dids/clover-builder/releases/latest'
  str="$(curl --silent "${repoURL}" )"
  echo "URL : [${str}]"
  v1=${str:87:11}
  echo "CloverISO version : [${v1}]"
  v2=${v1:7:4}
  echo "CloverISO version : [${v2}]"

  if [[ -z "${v1}" ]]; then
    echo -e "[ ${RED}ERROR${OFF} ]: 无法从${repoURL}获取最新release。"
    exit 1
  fi
}


function clean() {
  DIR="/Users/`users`/Desktop/clover_download"
  [[ -d "${DIR}" ]] &&  rm -rf "${DIR}"
}
# 如果网络异常，退出
function networkWarn() {
  echo -e "[ ${RED}ERROR${OFF} ]: 下载失败, 请检查网络状态!"
  clean
  exit 1
}

# 下载Clover仓库并解压最新release
function download() {
  getGitHubLatestRelease

  # 新建工程文件夹
  WORK_DIR="/Users/`users`/Desktop/clover_download"
  [[ -d "${WORK_DIR}" ]] &&  rm -rf "${WORK_DIR}"
  mkdir -p "${WORK_DIR}" && cd "${WORK_DIR}"
  pwd

  echo
  echo '----------------------------------------------------------------------'
  echo '|* 正在下载clover，源自github.com/Dids/clover-builder/releases/latest|'
  echo '----------------------------------------------------------------------'


  # 下载Clover
  local cfFileName="CloverISO-${v2}.tar.lzma"
  local cfURL="https://github.com/Dids/clover-builder/releases/download/${v1}/${cfFileName}"
  # GitHub的CDN是被Amazon所拥有, 所以我们在这添加 -L 来支持重置链接
  curl -# -L -O "${cfURL}" || networkWarn
  echo -e "[ ${GREEN}OK${OFF} ]下载完成"
}


# 主程序
function main(){
  printHeader
  download
  exit 0
}

main