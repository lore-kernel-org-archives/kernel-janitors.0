From: Jon Masters <jonmasters@gmail.com>
Date: Sat, 23 Oct 2004 00:33:33 +0000
Subject: Re: [KJ] [PATCH] net/ewrk3: replace schedule_timeout() with
Message-Id: <35fb2e590410221733387e435b@mail.gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============95533415584625025=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20041022232643.GC18906@us.ibm.com>
In-Reply-To: <20041022232643.GC18906@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============95533415584625025==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 22 Oct 2004 16:40:26 -0700, Nishanth Aravamudan <nacc@us.ibm.com> wrote:

> The original was:
> 
> schedule_timeout(HZ>>2);

I just wandered whether that was kicking around and assuming some
smaller value of HZ.

Jon.

--===============95533415584625025==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============95533415584625025==--
