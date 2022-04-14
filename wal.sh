#!/bin/sh
# This script enables wal support in dmenu using the Xresources patch.
# Written by speedie

WAL_VARS()
{
  COLORLIST=~/.cache/wal/colors
  XRESOURCES=~/.cache/wal/colors.Xresources
}

WAL_COLORS()
{
  COLOR_01=$(sed -n 8,8p $COLORLIST)
  COLOR_02=$(sed -n 1,1p $COLORLIST)
  COLOR_03=$(sed -n 9,9p $COLORLIST)
  COLOR_04=$(sed -n 8,8p $COLORLIST)
}

WAL_WRITE()
{
  echo "!!dmenu" >> $XRESOURCES
  echo "dmenu.background:       $COLOR_01" >> $XRESOURCES
  echo "dmenu.foreground:       $COLOR_02" >> $XRESOURCES
  echo "dmenu.selbackground:    $COLOR_03" >> $XRESOURCES
  echo "dmenu.selforeground:    $COLOR_04" >> $XRESOURCES
}

WAL_VARS
WAL_COLORS
WAL_WRITE
