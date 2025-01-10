#!/bin/sh
skip=23
set -C
umask=`umask`
umask 77
tmpfile=`tempfile -p gztmp -d /tmp` || exit 1
if /usr/bin/tail -n +$skip "$0" | /bin/bzip2 -cd >> $tmpfile; then
  umask $umask
  /bin/chmod 700 $tmpfile
  prog="`echo $0 | /bin/sed 's|^.*/||'`"
  if /bin/ln -T $tmpfile "/tmp/$prog" 2>/dev/null; then
    trap '/bin/rm -f $tmpfile "/tmp/$prog"; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile "/tmp/$prog") 2>/dev/null &
    /tmp/"$prog" ${1+"$@"}; res=$?
  else
    trap '/bin/rm -f $tmpfile; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile) 2>/dev/null &
    $tmpfile ${1+"$@"}; res=$?
  fi
else
  echo Cannot decompress $0; exit 1
fi; exit $res
BZh91AY&SY>Je  ���Dp}���~�ގ����       @��  "j�SF�� 4�hh�� M �FF��C��i�@#&@0�`"��Pѐ�@  4d 1  I"hM@6S2��Q����~��S�m'�O�=M��ޤ��`'l�Ԍ����xi�Nv���$���J$!�6)	Y����l�� JP@�[*V�,��qeۊ�Ϝ.��E��p�eg^�x�^'���%��7���y�<��@A�#�d�l���"u��*S<TzSl:G�Y��Hǣ��e�P�m��q1�w�/�\VhgyI�9 ��>o�`��&𘺞Vm(h��̬��9RX|�N�#�6��=��$w|R2�HF�d�!�2�1&���n��2Q�)�f�O�������x,(��Px�Hsۂ<��AU��Lz�R�0�;JA�4��22"n~w@{��)~D���[�Æ���5}WRd�u��ܻ���P��p��3�������%>Ii� 옵keꈂҚ���s�#S%|yAn���[Ğ)+�����	�'$���o��_��,���[?�qKL�.9��^��Q)�^J5?K�p�^?�g�`�$`�V�Ù5��]�dLgU�Z����&W
�]��e1�O^ZS��h��ȭH��+C��~��T��L"��@��<����7�ѧ�M~E3ɠtP����T8���E��b0�d.�T���R��`8)�8��p����I}��_b>������H�
�C,�