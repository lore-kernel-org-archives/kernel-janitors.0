From: Henne <henne@nachtwindheim.de>
Date: Tue, 02 May 2006 21:03:52 +0000
Subject: [KJ] 720KB Floppy on 64bit Linux
Message-Id: <4457C938.1070601@nachtwindheim.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

Hi there!

I got an old 720KB dos floppy and wanted to try it with my x86_64 2.6.17-rc=
3 kernel.

Mounting it Kernel says:
FAT: invalid media value (0x44)
VFS: Can't find a valid FAT filesystem on dev fd0

I tried it on my pentium with the same kernel (i386, of course), and it wor=
ks.
Mounted as vfat. All files there. No errors.

On the x86_64, noting.
Formatting a 1.44MB disk as 1.44MB works.
The integrity check on kfloppy works too.
Formatting a 1.44MB disk as 720KB works.
But checking integrity does not.
Kfloppy says that theres an error while low-level format on track 0.
Kernel says:
end_request: I/O error, dev fd0, sector 0
floppy0: Getstatus times out (50) on fdc 0

floppy driver state
-------------------
nowC15028397 last interruptC15028397 diff=3D0 last called handler=FFffffff8=
0360d1d
timeout_message=3Dfloppy start
last output bytes:
  2 90 4315027201
  9 90 4315027201
50 90 4315027201
f6 90 4315027201
  f 80 4315027600
  0 90 4315027600
45 91 4315027600
  8 81 4315027605
4d 80 4315027625
  0 90 4315027625
  2 90 4315027625
  9 90 4315027625
50 90 4315027625
f6 90 4315027625
4d 80 4315027998
  4 90 4315027998
  2 90 4315027998
  9 90 4315027998
50 90 4315027998
f6 90 4315027998
last result at 4315027998
last redo_fd_request at 4315027998
40 10  0  1  4  7  2
statusP
fdc_busy=3D1
fd_timer.function=FFffffff80362b84
timer_function=FFffffff8036301d
expires&01
nowC15028397
cont=FFffffff804b2b40
current_req=0000000000000000
command_status=3D-1

floppy0: get result error. Fdc=3D0 Last status=FFffffff Read bytes=3D0

floppy driver state
-------------------
nowC15028397 last interruptC15028397 diff=3D0 last called handler=FFffffff8=
0360d1d
timeout_message=3Dfloppy start
last output bytes:
  2 90 4315027201
  9 90 4315027201
50 90 4315027201
f6 90 4315027201
  f 80 4315027600
  0 90 4315027600
45 91 4315027600
  8 81 4315027605
4d 80 4315027625
  0 90 4315027625
  2 90 4315027625
  9 90 4315027625
50 90 4315027625
f6 90 4315027625
4d 80 4315027998
  4 90 4315027998
  2 90 4315027998
  9 90 4315027998
50 90 4315027998
f6 90 4315027998
last result at 4315027998
last redo_fd_request at 4315027998
40 10  0  1  4  7  2
statusP
fdc_busy=3D1
fd_timer.function=FFffffff80362b84
timer_function=FFffffff8036301d
expires&01
nowC15028397
cont=FFffffff804b2b40
current_req=0000000000000000
command_status=3D-1

floppy0: -- FDC reply errorend_request: I/O error, dev fd0, sector 0
Buffer I/O error on device fd0p16, logical block 0
floppy0: sector not found: track 0, head 0, sector 9, size 2
floppy0: sector not found: track 0, head 0, sector 9, size 2
end_request: I/O error, dev fd0, sector 8
Buffer I/O error on device fd0p16, logical block 1
floppy0: data CRC error: track 0, head 1, sector 8, size 2
floppy0: data CRC error: track 0, head 1, sector 8, size 2
end_request: I/O error, dev fd0, sector 16
Buffer I/O error on device fd0p16, logical block 2
floppy0: sector not found: track 1, head 0, sector 7, size 2
floppy0: data CRC error: track 1, head 0, sector 7, size 2
end_request: I/O error, dev fd0, sector 24
Buffer I/O error on device fd0p16, logical block 3
floppy0: data CRC error: track 1, head 1, sector 6, size 2
floppy0: data CRC error: track 1, head 1, sector 6, size 2
end_request: I/O error, dev fd0, sector 32
Buffer I/O error on device fd0p16, logical block 4
floppy0: data CRC error: track 2, head 0, sector 5, size 2
floppy0: data CRC error: track 2, head 0, sector 5, size 2
end_request: I/O error, dev fd0, sector 40
Buffer I/O error on device fd0p16, logical block 5
end_request: I/O error, dev fd0, sector 48
Buffer I/O error on device fd0p16, logical block 6
floppy0: data CRC error: track 3, head 0, sector 3, size 2
floppy0: data CRC error: track 3, head 0, sector 3, size 2
end_request: I/O error, dev fd0, sector 56
Buffer I/O error on device fd0p16, logical block 7
floppy0: data CRC error: track 0, head 0, sector 1, size 2
end_request: I/O error, dev fd0, sector 0
Buffer I/O error on device fd0p16, logical block 0

Maybe someone could format a floppy (1.44MB/720KB) as a 720KB too and send =
the results?

Greets,
Henne
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
