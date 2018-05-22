From: Edward Cree <ecree@solarflare.com>
Date: Tue, 22 May 2018 15:44:15 +0000
Subject: Re: [PATCH] net: vxge: fix spelling mistake in macro VXGE_HW_ERR_PRIVILAGED_OPEARATION
Message-Id: <11586972-0dbb-f86c-396c-ac863e10f18f@solarflare.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180522153616.13980-1-colin.king@canonical.com>
In-Reply-To: <20180522153616.13980-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Colin King <colin.king@canonical.com>, Jon Mason <jdmason@kudzu.us>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 22/05/18 16:36, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> Rename VXGE_HW_ERR_PRIVILAGED_OPEARATION to VXGE_HW_ERR_PRIVILAGED_OPERAT=
ION
> to fix spelling mistake.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
"Privilaged" doesn't look right either, maybe fix both at once?
=C2=A0-> VXGE_HW_PRIVILEGED_OPERATION

-Ed
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
