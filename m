From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Thu, 24 Mar 2005 15:47:42 +0000
Subject: Re: [KJ] [PATCH] input/joydev: Remove custom msecs_to_jiffies() macro
Message-Id: <20050324154742.GA2545@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============54055023885762066=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050324142422.GA4421@localhost.localdomain>
In-Reply-To: <20050324142422.GA4421@localhost.localdomain>
To: kernel-janitors@vger.kernel.org

--===============54055023885762066==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 24, 2005 at 03:24:22PM +0100, Tobias Klauser wrote:
> Replace the MSECS() macro with the msecs_to_jiffies() function provided
> in jiffies.h. The current macro is incorrect because HZ can have
> different values on different architectures.

You want jiffies_to_msecs() here, not msecs_to_jiffies().

Thanks,
Nish

--===============54055023885762066==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============54055023885762066==--
