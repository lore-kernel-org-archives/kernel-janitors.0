Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4C9331A57
	for <kernel-janitors@vger.kernel.org>; Wed,  5 Aug 2026 08:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785919484; cv=pass; b=LJO3LF/d7dRZuhAgg2MM15C89e6bIet7MrUqLUvljGC4HfCzAHWLi8bdekLCEzoaCywS4lyEtkhIDwR/1pTOHo3OJwurO2J3Q8P26t8FTuFnZx5fznAcDb14QWDxHlO3va0T3WlVt9q/WaXYBvYMafiOw3IbVIDwR243OiFdna0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785919484; c=relaxed/simple;
	bh=FnbA7S0cSZXFqeWKsgE7UzBvEHXkSW1qboecn7c9Eg8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qwpGMqO+PZEXqgKaTnVwTIZ+mol5gEznN8OP8EvVUq5MMDJEZlfIRBeiDR8hURCVei21cFkKHIxTefvCjWXBiGpIfupGvp0pS/Xdnk+zfK9dIj4qDZFI3S6wCJDtnMHzAcj+qFWVP+eXAqrcvEH9PhIgzKhhQqnup2VowM6OgSs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C92ZMnu4; arc=pass smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C92ZMnu4"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c2020421077so120937366b.3
        for <kernel-janitors@vger.kernel.org>; Wed, 05 Aug 2026 01:44:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785919482; cv=none;
        d=google.com; s=arc-20260327;
        b=cT1m+wGpStvc1ghxJR5JlOrOdIh95gROG5w51yocK2mESyMElNCe8bs5RY9gvmgQUC
         ZDzfEKISjnDGgCTNKAsvJZb49RVolIsVXTTegFUNG4REPdErrIA4CYqsbsg8rRcOFqVd
         fjw6oqCgOTx0bYQQ+kvFd1KPUZxIouVBieqBbS+dbhhdapMfd5a3aRSK8HmwVYWENehy
         Uj0BDXTfvZqdM35SedlfaMosILY7ePDYt7u0+0LtbuolOr2a21eTtfTKRTBekkdgdJRP
         Nq0i3nofk+4qnNU+tecMaqSqFeFJaUJfXpXCL7vtliPmYjw38XGOBWnDJaKALYlxTghL
         L8tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nY5HP+b24Ht/fZnfSMRFxga4V+U+6O49PdW3sBxXF8A=;
        fh=qXHMya/FjhWX9AlK0S4cBrcMwwa1+P5lry1dMXS+Qnw=;
        b=S1zq8IplgrfX97mCi3PfOnrD+GWBxh5K498JIKFkE59aFqK+LvEWjjDhZvIXbfrZjz
         3VkqEh7hzb8yIHZLtfTOXQTep5pgK0sjFP/Fc2JkR0rs/1EA9BK5Z40KTLAwI6ihH/hu
         Bqgy40RZ7A9cSsJ2bTmwyhzE5A86GE69YD9ZPB/HcwFyyup/pjN5KLccpmMKIgsJ2bBM
         94vDiVdMe2bbtnplOStM5UTmt/rXHrJAkAq0upz9mAnjqQCPckmKwPMdF0WVIcOE17Lm
         Y5quoSN/nGOz5gtHZl2iPcVwyaRuVwIiUJkiP1gwyyUdHimv5nFUwUp6u2n3P9voKO7m
         GNjw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785919482; x=1786524282; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nY5HP+b24Ht/fZnfSMRFxga4V+U+6O49PdW3sBxXF8A=;
        b=C92ZMnu4GLTcpX9MV58FPrpi1mfNiHciLCzixNbUmJjWmVxtL8SC5alDmpu8Cgha6K
         Mufhp0bv40RhlQj/iNF+ZHgnMZc9SAW0ANAxAZQV9fzi+YIo6Y8tmZAxXc0L28lcL5ze
         HUZJWXxjojcefpGT8RAA6XX0sBsQ3HGa29X5KJuEpI4cxoIs7d/dbMsiXfmldLLbq3T2
         AhASz7ssIf78egqygYhUsftsbZAKvfsC79txe1ZhJoW9i+ZJo6W296x2UV12SscaRCrb
         ZTYmLW7jihz1ipXbbySLsQpyZXvxc2eLpJG/hF7QRyCTPlAZw3/71xJmmO1VsunSquvm
         w5mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785919482; x=1786524282;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nY5HP+b24Ht/fZnfSMRFxga4V+U+6O49PdW3sBxXF8A=;
        b=dKb0lUTEloRunTP2LNjFM9oRt12WQEJ0TwJcRtiioWSF0kbxF9ItNL/BLJSsU8rLGr
         zHYPmVtOM8k9k7TV8FboCSu9Mb8y1U3iK3LV87CJ+dna/26wwexjtlAmgjzauBp/TdWg
         IKbnpcO8V0P0/XSaZn678lo9NzKrSO6eiCn4oibxxdkrf6OYse01sxA+60cjtKyIoDyR
         vBF4kexE46eLFxy1CHzZjpgo97kUGgE09pCJHMUe43A1nPnc7k1Os/+ftGIijXwzNl6Y
         piv/yC14bpfd8mLP6VASuBv3ShInulHxlm+DUrmAE6FdjRwQNUfpx8D/oyZh3A0uGREE
         /Yng==
X-Forwarded-Encrypted: i=1; AHgh+RoR8dJ1mJBZa/6VBhH4IKvAl6EXAKtJElgSgQj56V/9wvreYV87T6siA1yfk3/Pq3wcYzQ/wacpgKezrqHtI5s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxg24rIT3uEIlsXWXkBXZ4Z4IYfooPtDATM6FUa6rDF3lQzb/Lt
	698aWsFh8ylW3JI95AXKmxMDaRjS9yP6wiJmG3CG8qVubyU4DqQWZIlVAOQz+xBwTy9tU0ZwJRk
	d6tBzsVvF/DB1j1+7QKqvXynZYX89FEw=
X-Gm-Gg: AR+sD12e94lzwOP05vrYN+VIm6DDCQJcItcwLfwdJCJIBHN4kDo5qB6vf8sh26C0PPX
	Elt2uRS5hX+zHb6iu4ZSowvpporWVvGmLzbnzKGofKbiK7MJYwciolmWcqgH9ksjXEICfvW4Hjc
	yQn5JA8zOEsz8zLgccjMPL3EKIZwXFgtedgDpWDG0iIeZRGsTwAkq0IeK9s1qOAa2hABEoalDTr
	eZIWCg+PA3TESLapJ87cdgIYrP8tjA2ajVYGtsy8kZCfQqmTsTMoz07kIcHIWTV9fgjC8yxkaXo
	0aTc+iONlP7uOSYMJNUHTLbJ88D53y+4g0EQTPUgI5dT
X-Received: by 2002:a17:907:d20:b0:c1c:257e:4888 with SMTP id
 a640c23a62f3a-c2039cc4dc5mr243008466b.27.1785919481520; Wed, 05 Aug 2026
 01:44:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260804095648.783881-1-colin.i.king@gmail.com>
In-Reply-To: <20260804095648.783881-1-colin.i.king@gmail.com>
From: chelsy ratnawat <chelsyratnawat2001@gmail.com>
Date: Wed, 5 Aug 2026 14:14:29 +0530
X-Gm-Features: AUfX_my8FnLz2qavlfVQxZGUIEY94pPYq-LfoiMpCy0Uf6vNS7_25jGLSjfwNUw
Message-ID: <CAOeBcHP0XGCt6bbBBhDeM8LbTOmf-7CzUXW07F5_J7OmPMjJxg@mail.gmail.com>
Subject: Re: [PATCH][next] wifi: mt76: Fix spelling mistake "dowload" -> "download"
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, 
	Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-wireless@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, hlinux-mediatek@lists.infradead.org, 
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 4, 2026 at 3:29=E2=80=AFPM Colin Ian King <colin.i.king@gmail.c=
om> wrote:
>
> There is a spelling mistake in a dev_err message. Fix it.
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---

LGTM
Reviewed-by: Chelsy Ratnawat <chelsyratnawat2001@gmail.com>

>  drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drive=
rs/net/wireless/mediatek/mt76/mt76_connac_mcu.c
> index 2f925d22b9aa..9552fadbc17b 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
> @@ -3130,7 +3130,7 @@ mt76_connac_mcu_send_phy_ram_firmware(struct mt76_d=
ev *dev,
>                 err =3D mt76_connac_mcu_init_download(dev, addr, len, mod=
e);
>                 if (err) {
>                         dev_err(dev->dev,
> -                               "The request to dowload PHY firmware fail=
ed.\n");
> +                               "The request to download PHY firmware fai=
led.\n");
>                         return err;
>                 }
>
> --
> 2.53.0
>
>
