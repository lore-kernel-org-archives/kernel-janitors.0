From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 17 Jan 2005 22:44:00 +0000
Subject: [KJ] Re: [PATCH 9/21] char/ipmi_si_intf: replace schedule_timeout()
Message-Id: <20050117224400.GN24698@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============037079639482551663=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <41EC332A.8020603@mvista.com>
In-Reply-To: <41EC332A.8020603@mvista.com>
To: kernel-janitors@vger.kernel.org

--===============037079639482551663==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 17, 2005 at 04:41:15PM -0600, Corey Minyard wrote:
> Ok, I was unaware of the difference between msleep and mdelay (I was 
> actually reading "mdelay").
> 
> Actually, in the code I want to wait as small a time as possible without 
> spinning.  The operations being waited for generally happen in ~500us, 
> which is far too long to spin, but 10ms would be non-optimal if a faster 
> increment was available.  So I think it is still best as it is.

Yup, sounds right to me. Thanks for your help & responses!

-Nish

--===============037079639482551663==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============037079639482551663==--
