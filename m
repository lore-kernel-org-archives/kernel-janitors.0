From: Kai Makisara <Kai.Makisara@kolumbus.fi>
Date: Mon, 27 Sep 2004 19:35:16 +0000
Subject: [Kernel-janitors] Re: [PATCH 2.6.9-rc2 15/16] scsi/st: replace
Message-Id: <Pine.LNX.4.58.0409272231360.3608@kai.makisara.local>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============46969616934568958=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.58.0409161253580.14212@server.home>
In-Reply-To: <Pine.LNX.4.58.0409161253580.14212@server.home>
To: kernel-janitors@vger.kernel.org

--===============46969616934568958==
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Mon, 27 Sep 2004, Nishanth Aravamudan wrote:

> Any comments would be appreciated.
> 
> Description: Use msleep_interruptible() instead of
> schedule_timeout() to guarantee the task delays as expected.
> 
Looks fine to me (assuming msleep_interruptible() does what the name 
suggests :-)

Thanks,
Kai

--===============46969616934568958==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============46969616934568958==--
