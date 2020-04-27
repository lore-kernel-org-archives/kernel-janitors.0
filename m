From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Mon, 27 Apr 2020 05:52:23 +0000
Subject: Re: [PATCH v2 2/3] net: qrtr: Add MHI transport layer
Message-Id: <20200427054023.GA3311@Mani-XPS-13-9360>
List-Id: <kernel-janitors.vger.kernel.org>
References: <85591553-f1f2-a7c9-9c5a-58f74ebeaf38@web.de>
In-Reply-To: <85591553-f1f2-a7c9-9c5a-58f74ebeaf38@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Chris Lew <clew@codeaurora.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hemant Kumar <hemantk@codeaurora.org>, Jeffrey Hugo <jhugo@codeaurora.org>, Kalle Valo <kvalo@codeaurora.org>, Siddartha Mohanadoss <smohanad@codeaurora.org>

On Sun, Apr 26, 2020 at 03:45:41PM +0200, Markus Elfring wrote:
> > Hence, this commit adds MHI transport layer support to QRTR for
> > transferring the QMI messages over IPC Router.
>=20
> I suggest to reconsider software development consequences around
> another implementation detail.
>=20
>=20
> =E2=80=A6
> > +static int qcom_mhi_qrtr_send(struct qrtr_endpoint *ep, struct sk_buff=
 *skb)
> > +{
> =E2=80=A6
> > +	rc =3D mhi_queue_skb(qdev->mhi_dev, DMA_TO_DEVICE, skb, skb->len,
> > +			   MHI_EOT);
> > +	if (rc) {
> > +		kfree_skb(skb);
> > +		return rc;
> > +	}
> =E2=80=A6
> > +}
>=20
> I propose again to add a jump target so that a bit of exception handling =
code
> can be better reused at the end of this function implementation.
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/D=
ocumentation/process/coding-style.rst?id=B2768df24ec400dd4f7fa79542f797e904=
812053#n450
>=20

Matter of taste! goto's are really useful if there are multiple exit paths
available. But in this case there is only one and I don't think we may add
anymore in future. So I'll keep it as it is.

Thanks,
Mani

> +	if (rc)
> +		goto free_skb;
> =E2=80=A6
> +	return rc;
> +
> +free_skb:
> +	kfree_skb(skb);
> +	return rc;
> +}
>=20
>=20
> Regards,
> Markus
