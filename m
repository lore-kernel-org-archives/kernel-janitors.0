From: "David S. Miller" <davem@redhat.com>
Date: Thu, 29 Jul 2004 02:05:14 +0000
Subject: [Kernel-janitors] Re: [PATCH] net/sungem: replace
Message-Id: <20040728190514.7d39bb8a.davem@redhat.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============36873673639525606=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============36873673639525606==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 27 Jul 2004 12:00:41 -0700
Nishanth Aravamudan <nacc@us.ibm.com> wrote:

> I would appreciate any comments from the janitors list. 
> 
> Applys-to: 2.6.7
> 
> Description: Use msleep() instead of schedule_timeout() to guarantee
> the task delays for the desired time.

Looks good to me.

Patch applied, thank you.

--===============36873673639525606==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============36873673639525606==--
