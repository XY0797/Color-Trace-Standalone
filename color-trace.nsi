;--------------------------------

; ��װ���������
Name "color-trace"

; ��װ�����ͼ��
Icon "icon.ico"

; ����ļ�������
OutFile "color-trace.exe"

; ����Windows Vista�ϵ�Ӧ�ó�����Ȩ
RequestExecutionLevel user

; ����Unicode��װ����
Unicode true

; Ĭ�ϰ�װĿ¼
InstallDir $DESKTOP

;--------------------------------

; ����ѹ���㷨
SetCompressor /SOLID lzma

;--------------------------------

; ҳ��

; ����ҳ�沼��
Page directory
Page instfiles

;--------------------------------
; ��װ����

Section "" ;û�����ҳ�棬���Ʋ���Ҫ

  ; �������·��Ϊ��װĿ¼
  SetOutPath $INSTDIR

  File /r "color-trace"

SectionEnd