From: Gerd Knorr <kraxel@bytesex.org>
Date: Tue, 27 Jul 2004 06:59:59 +0000
Subject: [Kernel-janitors] Re: [PATCH] video/bttv-driver: replace
Message-Id: <20040727065959.GA17029@bytesex>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============23954184606094064=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040727062650.GG8798@bytesex>
In-Reply-To: <20040727062650.GG8798@bytesex>
To: kernel-janitors@vger.kernel.org

--===============23954184606094064==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 27, 2004 at 08:26:50AM +0200, Gerd Knorr wrote:
> On Mon, Jul 26, 2004 at 03:47:30PM -0700, Nishanth Aravamudan wrote:
> > set_current_state(TASK_INTERRUPTIBLE);
> > schedule_timeout(some_time);

> > msleep(jiffies_to_msecs(some_time));
> > 
> > msleep() is not exactly the same as the previous code,
> 
> How does it differ?  And what exactly is the point in replacing it?

Especially as msleep() does busy waits (unless I've missed something)
whereas schedule_timeout() doesn't?  I'd like to veto this one, and
the other ones touching video4linux drivers as well.

  Gerd

-- 
return -ENOSIG;

--===============23954184606094064==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============23954184606094064==--
