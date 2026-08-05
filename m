Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DF0D3E7BA0
	for <kernel-janitors@vger.kernel.org>; Wed,  5 Aug 2026 08:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785919724; cv=pass; b=K7Q1JRkRDAzjMqkviwqLTH83w0L6N0XWRN/3JH7tufVD6sxEnQOHg+WBeBZ2RV9IlJ6yU+iEMP9TWSYabVcXtXhBDKPi8Mb/GINCYLYnRrZvH2FxZLglB5dwhZ8fue7i/G9HIkd5KzdjBARrlpjbGtGSCSp2zhJ2BnIXk/Zuc88=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785919724; c=relaxed/simple;
	bh=c8d6oY/qvZgV+eMSrglWUNtmpyiZdkYKgyx5ZV+Ovg4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nSLawb+gbVj3DFvXb7eWZ8wXpIGHoLnX0zhse3bNrIxwS8cwPI17X0bCmP/OKO2xOs8IP+g6TIrnsSXJK4kcpoN+fKF1nsMHmNgAqQuSF39qRzAemqhrRt0nDa63LkNblwpGSVnX0Y2WAXmASUGWPDRvrm8/VmGX+sN4dCmKuF4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UqAQhg1i; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UqAQhg1i"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-69c108fee7fso977289a12.3
        for <kernel-janitors@vger.kernel.org>; Wed, 05 Aug 2026 01:48:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785919719; cv=none;
        d=google.com; s=arc-20260327;
        b=aKyR+xnX3aX+ZyeqJ3DWWXk5jdTtklliETW3Q/k2U1r6mZ5xDJyZb4uaK+oC5saAkF
         ncsxUDU23MtCmAomDYddeiCd8HYX1tgcvK5y50LRD9LViagEtzgCZScAawAE7XtmO53v
         iD2WmxMBYDyNq5eI1qilnthhSk3zEVkS6kwtpMBiGMgwQpMYzdkDSBm1/0Ko9DUUK5CL
         M8MUMNvu2ouBynPWGSQLYg+s4BoEUItzl4N/M8b/zvoD36CbmR82d3wm2MIsnjspONGR
         VO1iE2I2M4Uku9cBHMrdZ4Ap90jfL23wAca463WYZVkYZtOSUSqCqTWokwx0s9e0ttul
         8fDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Dw08ZkvlKjGUhl/zyBOS4XsCzhr7+Rt7Yc3t6JVkFQU=;
        fh=WdwAIC6A1I6pTX0NagYVkGVEFGkAnSAnlJiTsx5vP6I=;
        b=YwFN78Yf4IzvzklvBatK0/CZDN2qrt1U1x3rMCA8epMeuVzeqiVLEKGWasJMCPBmj2
         vuLH0/FeeWGTn/rGK065oPktKuH+QoblLhE5FpEUFvT9XP+n5yMqG3FoJXl3EZ8mG724
         ynKZ0ybT53AkBarX4idl0+J1XIH/jfHJavgeQa8SiYNUQJQEHjniGDPMFXDaCN1heDlB
         H9InUibmPSMqO9n+be2tYnSyPNumUf+7iSl2sYbfUl9hk68A4qNXPSXlMNjYDGPswttB
         0DhiuofMIkSNgIxLy4w1EqkFBuXMyGhxzlPch5geHSXzPVt3FFGSBe5mih3o3FkyZoUZ
         Pz/g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785919719; x=1786524519; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Dw08ZkvlKjGUhl/zyBOS4XsCzhr7+Rt7Yc3t6JVkFQU=;
        b=UqAQhg1io9JNmiq5VTFxQi3orT8SugQcnPjVDgmpNdjbxo2qwL4gvYBzpLcK2jFMC+
         TXuYpSxWqFdMa3gP2yKIl3PsB6EHqpRVXX6VhT5nnm99OhEPJNWMHgFCiyP0mjM+YvIn
         YLMZFlSXoosO1C2hZD9KlE14/VK8MGv99picFX/CNpBZQ50j+wUhIwyfW+Mp5Ah9hdHN
         RsFNUZ1AOmC5XpzVy7/CNME2RZIDUYM4FCia6EFAhOUHRTBThJHpKzucn//aG+gHZYfS
         xVVwA3LzwDumuEhZu3UYdfz3k1SXwTiA3ijqPMLVxYZJA0H29+rmc2Mwo45zWsN8Zhgh
         8QZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785919719; x=1786524519;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dw08ZkvlKjGUhl/zyBOS4XsCzhr7+Rt7Yc3t6JVkFQU=;
        b=LrhqYjrziTtAp45/IK+H7bCIUzOpYu3Ovc/b//SnLnEfXuV1CpDfmz2q0Zjqs8+rMP
         KFgXHWojLd8Wh9c9hsgRm9F5zw5XxTD/YO4GUrIWiGKarrEiNjtzf0hjVBZovRC16QEA
         wGk0hs6jabOc62o2aq5B9P3JphzcDnO/cgMchonHBXCdnEjAjtOLh0Sin1pUgAMf/uCa
         +YX5/4D8Jil6rRDp0MpJSfseibjfs0XodlBXco3NszFtg3Pvkwuvd2wJFchzRwK0xg//
         UTEMaGkvxDHJAf3qIiKiMyfFoaPjQJt1gu4d1rTFUYiz+NLdwqww4ypP0SrVU1duERoq
         E/FQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqur/CWi/R6QetNSmZoBjqQJaLan0wrtFZ49pRVdBUa5orGViDnoTGjTAq/QF1fffR+dnihCpuveemljFv23to=@vger.kernel.org
X-Gm-Message-State: AOJu0YwycnKSCWcpkW+ZkA1CaLVWK/XRfWSI5spyMsFwh8gr0SOE5awD
	Rg7yd2wgDgTtFOnH+Lm1KJSr6G+iSRtkAhDVPIrL5vt0fUy6OfgLOdH9fj/mNuvPFNP/cN3cH/d
	0JBd20q/EqpfwK5nSlxGAXG3oHwOEeoQ=
X-Gm-Gg: AR+sD13CyqO9aiVpeRjslDlSH50w8DkQlFJ545kDpb+Z5tF3pqn9IdfVSi9H0h6sPM5
	c9Ard1YpH9lXTfNoIjFhA2R5ftWKGWhOB09wyYJ3LMbR7e1/T8NKnChw/RDuzruQYtO5TfqdKHw
	VPyhUhQNm1wsZ+H86obyp3em8Ix+HAiqBaXU3Ur9Qa8Ho9AdWguVTc052LMdLwHCnywFafSr7fT
	huDiXlS+R1wIbmmmFpMtzBDyqB6rKht5300FWLZ8zGSFxZo5gsYxDQnjSXvscC7npVFIY80iqgD
	OBLww7YPiRkVlFnuSMRMFTjpIrDmqJIzURZVoDKB/3w3
X-Received: by 2002:a17:907:7b91:b0:c12:764e:326 with SMTP id
 a640c23a62f3a-c2039d10eb3mr203394266b.27.1785919719449; Wed, 05 Aug 2026
 01:48:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260804095832.784121-1-colin.i.king@gmail.com>
In-Reply-To: <20260804095832.784121-1-colin.i.king@gmail.com>
From: chelsy ratnawat <chelsyratnawat2001@gmail.com>
Date: Wed, 5 Aug 2026 14:18:28 +0530
X-Gm-Features: AUfX_my0J7JoH0gW8Dxh60k6T4o2zXgNHRGX1_3KTnrwVaQICcPvxXITiqvQcQo
Message-ID: <CAOeBcHMBmzQAqSYWLotdb2k98+i+YaXyfTMy6sbqUr7geM5=Zg@mail.gmail.com>
Subject: Re: [PATCH][next] wifi: rtw89: coex: Fix spelling mistake "verseion"
 -> "version"
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Ping-Ke Shih <pkshih@realtek.com>, linux-wireless@vger.kernel.org, 
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 4, 2026 at 3:39=E2=80=AFPM Colin Ian King <colin.i.king@gmail.c=
om> wrote:
>
> There is a spelling mistake in a rtw89_warn message. Fix it.
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
Reviewed-by: Chelsy Ratnawat <chelsyratnawat2001@gmail.com>

>  drivers/net/wireless/realtek/rtw89/coex.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/net/wireless/realtek/rtw89/coex.c b/drivers/net/wire=
less/realtek/rtw89/coex.c
> index 5a9dc4d8a00b..84ae14f993e6 100644
> --- a/drivers/net/wireless/realtek/rtw89/coex.c
> +++ b/drivers/net/wireless/realtek/rtw89/coex.c
> @@ -4086,7 +4086,7 @@ static void _set_rf_trx_para(struct rtw89_dev *rtwd=
ev)
>                 ul_para_num =3D chip->rf_para_ulink_num_v0;
>                 dl_para_num =3D chip->rf_para_dlink_num_v0;
>         } else {
> -               rtw89_warn(rtwdev, "[BTC]%s(), No rf_para for verseion %d=
\n",
> +               rtw89_warn(rtwdev, "[BTC]%s(), No rf_para for version %d\=
n",
>                            __func__, ver->fcxtrx);
>                 goto next;
>         }
> --
> 2.53.0
>
>
