From: Lee Jones <lee.jones@linaro.org>
Date: Thu, 07 Nov 2013 10:06:09 +0000
Subject: Re: [patch] mfd: pm8921: potential NULL dereference in pm8921_remove()
Message-Id: <20131107100609.GL30901@lee--X1>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20131107080420.GP21844@elgon.mountain>
In-Reply-To: <20131107080420.GP21844@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: David Brown <davidb@codeaurora.org>, Abhijeet Dharmapurikar <adharmap@codeaurora.org>, Daniel Walker <dwalker@fifo99.com>, Bryan Huntsman <bryanh@codeaurora.org>, Samuel Ortiz <sameo@linux.intel.com>, linux-arm-msm@vger.kernel.org, kernel-janitors@vger.kernel.org

Just a thought. If you use `git format-patch` you don't have to
hand-craft the [PATCH] part of the subject line.

> We assume that "pmic" could be NULL and then dereference it two lines
> later.  I fix this by moving the dereference inside the NULL check.
>=20
> Fixes: c013f0a56c56 ('mfd: Add pm8xxx irq support')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Patch applied thanks.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
