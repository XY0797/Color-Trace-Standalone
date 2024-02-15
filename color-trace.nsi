;--------------------------------

; 安装程序的名称
Name "color-trace"

; 安装程序的图标
Icon "icon.ico"

; 输出文件的名称
OutFile "color-trace.exe"

; 请求Windows Vista上的应用程序特权
RequestExecutionLevel user

; 构建Unicode安装程序
Unicode true

; 默认安装目录
InstallDir $DESKTOP

;--------------------------------

; 设置压缩算法
SetCompressor /SOLID lzma

;--------------------------------

; 页面

; 定义页面布局
Page directory
Page instfiles

;--------------------------------
; 安装内容

Section "" ;没有组件页面，名称不重要

  ; 设置输出路径为安装目录
  SetOutPath $INSTDIR

  File /r "color-trace"

SectionEnd