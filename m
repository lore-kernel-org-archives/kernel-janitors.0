From: Gerd Knorr <kraxel@bytesex.org>
Date: Tue, 27 Jul 2004 06:26:50 +0000
Subject: [Kernel-janitors] Re: [PATCH] video/bttv-driver: replace
Message-Id: <20040727062650.GG8798@bytesex>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============69783608044133061=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============69783608044133061==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 26, 2004 at 03:47:30PM -0700, Nishanth Aravamudan wrote:
> I would appreciate any comments from the janitors list. This is one (of
> many) cases where I made a decision about replacing
> 
> set_current_state(TASK_INTERRUPTIBLE);
> schedule_timeout(some_time);
> 
> with
> 
> msleep(jiffies_to_msecs(some_time));
> 
> msleep() is not exactly the same as the previous code,

How does it differ?  And what exactly is the point in replacing it?

  Gerd

-- 
return -ENOSIG;

--===============69783608044133061==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============69783608044133061==--
