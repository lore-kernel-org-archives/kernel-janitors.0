From: Anupam Kapoor <anupam.kapoor@gmail.com>
Date: Thu, 01 Jul 2004 13:22:49 +0000
Subject: [Kernel-janitors] doubt in drivers/usb/class/audio.c
Message-Id: <e3177630407010610608b87e9@mail.gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============64203182658045344=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============64203182658045344==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

hi, 

while checking the above file for proper usage of set_current_state, i
came accross the following fragment (at approx line 2670) in
drivers/usb/class/audio.c:usb_audio_open()

	__set_current_state(TASK_INTERRUPTIBLE);
        add_wait_queue(&open_wait, &wait);

the problem here (imho) is that, it is possible that the
current->state write is re-ordered after the process was added to the
wait queue. if the task gets woken up in between those events, then we
have a problem.

so what actually happens is

add_wait_queue(&open_wait, &wait);
<the task get's woken up here>
__set_current_state(TASK_INTERRUPTIBLE);

now we are in a big sleep.

i think __set_current_state should just be replaced with
set_current_state which provides the appropriate memory barrier ?

kind regards
anupam

--===============64203182658045344==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============64203182658045344==--
