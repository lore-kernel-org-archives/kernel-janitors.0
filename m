From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 17 Jan 2005 23:29:56 +0000
Subject: [KJ] Re: [PATCH 14/21] net/s2io: replace schedule_timeout() with
Message-Id: <20050117232956.GV24698@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============93827145597080053=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <200501172315.j0HNFAaH027053@guinness.s2io.com>
In-Reply-To: <200501172315.j0HNFAaH027053@guinness.s2io.com>
To: kernel-janitors@vger.kernel.org

--===============93827145597080053==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 17, 2005 at 03:15:05PM -0800, Raghavendra Koushik wrote:
> Correct me if Iam wrong, but isn't HZ always defined as 
> "number of jiffies" on the machine that equals 1sec in duration. 
> So even if duration of jiffy varies, Macro HZ is assured to be 1 sec.
> This way schedule_timeout (HZ / 2) on any machine is supposed to 
> timeout after half a second and so on and so forth.

You are correct that timing out relative to HZ is ok. However, I would like to
remove this dependency wherever it exists. That way requesting a delay of
500 milliseconds can always be done via msleep() and if the behind-the-scenes
workings of schedule_timeout() change (for instance relative to tickless
systems), msleep() should still succeed.

There are some issues with the task states (more applicable to
TASK_INTERRUPTIBLE than TASK_UNINTERRUPTIBLE), but they are not relevant to your
code.

The patch really is more for consistency's sake. I don't want people to see your
driver and then assume they should use schedule_timeout() because someone else
has. msleep() is the preferred interface for longer unconditional delays. It
also makes it clearer that the sleep is for 500 msecs (e.g.) than HZ/2, IMO.

Thanks,
Nish

--===============93827145597080053==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============93827145597080053==--
