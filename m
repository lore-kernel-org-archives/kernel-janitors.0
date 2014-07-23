From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 23 Jul 2014 13:25:27 +0000
Subject: Re: [PATCH 4/4] drivers/pinctrl/qcom/pinctrl-msm.c: drop negativity check on unsigned value
Message-Id: <CACRpkdZJQTBX00zBt418-Yqi7VsYF9epuB3WuzW=Y5vV0QOsaw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1405614579-4652-1-git-send-email-andrey.krieger.utkin@gmail.com>
In-Reply-To: <1405614579-4652-1-git-send-email-andrey.krieger.utkin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Andrey Utkin <andrey.krieger.utkin@gmail.com>
Cc: kernel-janitors@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Stephen Boyd <sboyd@codeaurora.org>, Bjorn Andersson <bjorn.andersson@sonymobile.com>

On Thu, Jul 17, 2014 at 6:29 PM, Andrey Utkin
<andrey.krieger.utkin@gmail.com> wrote:

> [linux-3.16-rc5/drivers/pinctrl/pinctrl-msm.c:145]: (style) Checking if
> unsigned variable 'mux_bit' is less than zero.
>
>     if (WARN_ON(g->mux_bit < 0))
>         return -EINVAL;
>
> Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=80491
> Reported-by: David Binderman <dcb314@hotmail.com>
> Signed-off-by: Andrey Utkin <andrey.krieger.utkin@gmail.com>

Patch applied after fixing $SUBJECT, Bj=C3=B6rn protest if you don't like
it...

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
