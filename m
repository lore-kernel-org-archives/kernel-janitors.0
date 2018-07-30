From: Daniel Lezcano <daniel.lezcano@linaro.org>
Date: Mon, 30 Jul 2018 07:29:32 +0000
Subject: Re: [PATCH -next v3] thermal: armada: fix copy-paste error in armada_thermal_probe()
Message-Id: <8d8a83d0-d1e5-5868-6994-06feb084a476@linaro.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1532934423-179537-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1532934423-179537-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On 30/07/2018 09:07, Wei Yongjun wrote:
> The return value from devm_kzalloc() is not checked correctly. The
> test is done against a wrong variable. Fix it.
>=20
> Fixes: e72f03ef2543 ("thermal: armada: use the resource managed registrat=
ion helper alternative")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
> v2 - > v3: fix the description
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
