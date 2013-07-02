From: Imtiyaz Hussain <eyeonu.imtiyaz@gmail.com>
Date: Tue, 02 Jul 2013 23:56:33 +0000
Subject: Require mentoring for picking up
Message-Id: <CANpOL-w=W47NUg04nHRtL4S+Fpgt7SbigCwigHCsda31woccvQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello list,

I have set up my test-box with help from Kumar Amit Mehta. I would
like to start kernel janitorial work and would like to take up the
below task found in TODO link (
http://kernelnewbies.org/KernelJanitors/Todo ):-

"...From: Hans Grobler
- audit ioctl functions to make sure there is no way a user can crash
the machine or do sensitive stuff. For example, check for the
necessary capabilities. Check that no userspace pointers are accessed
directly. be careful with this... it takes a while to figure out which
ioctls are covered by the parent ioctl function (these can be nested
to great depths)..."

I looked at the mailing lists and found no one is working on this.
Please correct my understanding. I am new to kernel newbies, so this
is what i think before starting:-
1. Contact Hans Grobler for starting up ?
2. Find files with ioctl functions already implemented and do the
required assessment.

Also, needed some advise on git branching to work on the kernel.

Your advise will be helpful.

Sincerely,
Immi
