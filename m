From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Thu, 03 Mar 2005 18:02:52 +0000
Subject: [KJ] [RFC][PATCH 0/5] add poll_event*() interface
Message-Id: <20050303180252.GC11600@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============92216336315282732=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============92216336315282732==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

The following patches, including the one below, attempt to create a new
sleep interface.

In reviewing the remaining schedule_timeout() callers in the kernel, I
noticed that a number of usages of this function obey this model:

/* sleep at most this long */
timeout = jiffies + some_time;
/* every interval of time, check some_event's state */
while (some_event) {
	/* state to sleep in depends on the intent */
	set_current_state(TASK_{UN,}INTERRUPTIBLE);
	/* each iteration sleep for some_other_time */
	schedule_timeout(some_other_time);
}

Now, I thought to myself, this is very similar to wait_event() and co.,
but without wait-queues. And, thus, instead of a wait-queue being the
trigger to check a condition, the some_other_time sleep going by is.

Thus, it seemed logical to add an interface to do exactly this in a nice
compact way, but using msleep() and msleep_interruptible().

Patch 1/5: Adds the poll_event(), poll_event_timeout(),
poll_event_interruptible() and poll_event_interruptible_timeout()
interfaces.

Patch {2,3,4,5}/5: Demonstrates the utitlity of poll_event*() in various
drivers.

I am more than happy to change the names of these macros, change the
names of the variables, or whatever other suggestions you may have. I
closely modelled the macros after wait_event*(), which should be
apparently.

If this code has a decent response from KJML, I will go ahead and push
it to LKML.

Thanks,
Nish

--===============92216336315282732==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============92216336315282732==--
