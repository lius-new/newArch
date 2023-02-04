#!/bin/bash

amixer set Master 5%-
kill -36 $(pidof dwmblocks)
