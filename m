From: Stoyan Gaydarov <stoyboyker@gmail.com>
Date: Wed, 18 Mar 2009 02:14:30 +0000
Subject: Ioctl changes
Message-Id: <6d291e080903171914m4522c54eo70b683b763b9011@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

I have been working on a patch set to finish converting the ioctl to
unlocked_ioctl for file_operations and i was wondering if i should
even bother with drivers that seem to already use a mutex? or should i
do it just to be complete and to make sure nothing is broken and that
the users of ioctl are aware of the situation?

-- 

-Stoyan
