From: Dave Airlie <airlied@linux.ie>
Date: Sun, 27 Mar 2005 07:06:23 +0000
Subject: [KJ] Re: [PATCH] drm/drm_os_linux: use
Message-Id: <Pine.LNX.4.58.0503270805370.1875@skynet>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============92077487187389595=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============92077487187389595==
Content-Type: TEXT/PLAIN; charset=US-ASCII


On Wed, 2 Mar 2005, Nishanth Aravamudan wrote:

> Hi,
>
> Please consider applying.
>
> Description: Rather than use custom code in DRM_WAIT_ON() to do exactly
> what wait_event_interruptible_timeout() does, use the function and just
> change the return values appropriately.

I've applied this to CVS.. I'll wait for next kernel before I apply it
there....

Dave.

-- 
David Airlie, Software Engineer
http://www.skynet.ie/~airlied / airlied at skynet.ie
Linux kernel - DRI, VAX / pam_smb / ILUG


--===============92077487187389595==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============92077487187389595==--
