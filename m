From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Fri, 21 Jan 2005 22:05:57 +0000
Subject: [KJ] Re: [linux-usb-devel] [PATCH 36/39] usb/kaweth: use
Message-Id: <20050121220557.GV3340@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============96986686303214098=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <200501212302.32887.oliver@neukum.org>
In-Reply-To: <200501212302.32887.oliver@neukum.org>
To: kernel-janitors@vger.kernel.org

--===============96986686303214098==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 21, 2005 at 11:02:32PM +0100, Oliver Neukum wrote:
> Am Freitag, 21. Januar 2005 22:36 schrieb Nishanth Aravamudan:
> > Hi,
> > 
> > Please consider applying.
> > 
> > Description: Use wait_event_timeout() instead of custom wait-queue code. Remove
> > now unused variables. I changed the code to only add to the wait-queue if
> > necessary, but I'm not sure if this is correct.
> 
> The macro seems essentially identical. If it compiles, what problems are
> you afraid of?

Oh I agree the code is identical, but if you look at the patch, I don't add to
the queue before the if(status) check (which, if true, will remove from the
wait-queue). I just wasn't sure if that part of the chane would be ok
(intuitively it seemed so to me, but I'm not a wait-queue expert).

Thanks,
Nish

--===============96986686303214098==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============96986686303214098==--
