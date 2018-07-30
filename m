From: Daniel Lezcano <daniel.lezcano@linaro.org>
Date: Mon, 30 Jul 2018 06:18:53 +0000
Subject: Re: [PATCH -next] thermal: armada: fix return value check in armada_thermal_probe_legacy()
Message-Id: <0dfc85d7-2e71-119e-5fd2-a4f130e282dd@linaro.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1532918524-46054-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1532918524-46054-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On 30/07/2018 04:42, Wei Yongjun wrote:
> In case of error, the function platform_get_resource() returns NULL
> pointer not ERR_PTR(). The IS_ERR() test in the return value check
> should be replaced with NULL test.
>=20
> Fixes: 175637792d45 ("thermal: armada: convert driver to syscon register =
accesses")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---

Reviewed-by: Daniel Lezcano <daniel.lezcano@linaro.org>


--=20
 <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software for ARM=
 SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
