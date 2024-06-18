Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC9715ECD2
	for <kernel-janitors@vger.kernel.org>; Tue, 18 Jun 2024 10:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718706180; cv=none; b=dHUY5tLKIYkPOFDSAlznc2SQyMDIkCsLlZZZ+OSsSV+60TxsrXTqYQlavkAxXh8p1g47YLG8o4J6/KJGVocCfWZcadQfLPHSJduVPvew5et3JsFK2/v8ZPBo5bNS+cO/aJ3eZmL+LbQ2JmrGSo++HJVzDUF8F2d7mzDoh9N6AgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718706180; c=relaxed/simple;
	bh=ihV4mhCIBMNw0GbrSjpo4F1rbbfmrGIFerZHE45EcbQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PjrVDjWVlcyBQ82/nKEhpNnoOEbTjEIra2flxyVGU6CUe+VoK3zxEsUkqdcHKoCuSL6kK8sI+3rVFwNZqDLsoblPwwIq30Gck4Bv6jLEZE2zXKVAoI73V2Yu/OR2dzw3G/4Gy8pvrpxFFA2ezypPDubanz4CT5Eh0zkWqbRdkKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qrR4+QWG; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qrR4+QWG"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2e724bc466fso62975621fa.3
        for <kernel-janitors@vger.kernel.org>; Tue, 18 Jun 2024 03:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718706177; x=1719310977; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ihV4mhCIBMNw0GbrSjpo4F1rbbfmrGIFerZHE45EcbQ=;
        b=qrR4+QWGX/V4Z0fooMKHUzG0SCAqQ377tFKzKAR9H65J1Atf8JlaTTSFZCG5thE3sn
         HbOSgCwep3q5RtM4FpXdQDsDvjDe5is8vnMOrjdeG70uSWmYFKqYyFDAEvSILpj6xybQ
         p1tX8LisknFalZE5MRQjQqzJeHvxBz2gI/jbSBW7fygf/jt1nLY51QO/y2l3pychT7g1
         zJGgfIXhwL7FNHYd8RZOnFWVZ01i3Ak3AIdV5brRLVznaT0xEoCQA++ZTkHsHqe6q43t
         LtrASAyP0OpxqM9ucFidIEshKABF2dOL+9X0hKnoaTDu9TDyI8bji27IsQBVfvjm/sOP
         PweA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718706177; x=1719310977;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ihV4mhCIBMNw0GbrSjpo4F1rbbfmrGIFerZHE45EcbQ=;
        b=Ggze0kVUaceHhuGxb9E1rM81lsZYnSL2AnNqa4Y7CGW7DFIvZBJybfdqVRNhDYcZ/M
         KQUVDcKWOEhy04rAzSG38azZpgbSBgjolKU07RLkbgCbdubuF+9LWUeQH72v+TM4gxj7
         r9/+ZABpL08QqIzMczSoDC4G+cuMzFeuGYvHq82jucokq5tnMQ8joRqlmb2InjQAPIBD
         75hj3ZkX4VV8EfBLU1rZq8B320AphG6twleoV5f1Som+lkSdWXpBMQy+3G2kE4HwEUuW
         aFrob5AFJz+9vfRlH4mUvaY18i+P/bPyvpjuRopXDdZHKY9KMlSZUtELr3kbZYYHxhTg
         MNUw==
X-Forwarded-Encrypted: i=1; AJvYcCWkT5oS2pQalVrco3rV+rT7D8zjSvZdoef+qRJYeed6PgvZJMaoC8fpS7s3rTagOyzB/n7j9XG9qn8kXT9DGHzb07S06Yo9Db9RtUlYnNR9
X-Gm-Message-State: AOJu0Ywn/TEO8w8KpZyEjpyIuvuCMjQw/Ap/UhGyOQKeXIBmprhbwiMM
	fDFs3rICYpc7tKPkP7yg8YsfQXZ5Kd8om9GrkejuyGM8DFbpW7JMaGarTBjkIWVL/vnN0FbBHxM
	2Hs2CptJdBVqfiewQAeiYlVoFaTmhoF1u3EBth6DkYEG0yu1J
X-Google-Smtp-Source: AGHT+IH022WCOLlxYlftggBORDsbGqRdC1MMvSHHgSlDUwRF2SFmVC/CN9nibvTBvxf4WniRU2b80Vh9i/HWSfVw6SQ=
X-Received: by 2002:a05:6512:4010:b0:52c:90a6:35f7 with SMTP id
 2adb3069b0e04-52ca6e9af3amr12476647e87.58.1718706176667; Tue, 18 Jun 2024
 03:22:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240613-md-arm64-drivers-clk-versatile-v1-1-6b8a5e5e00ef@quicinc.com>
In-Reply-To: <20240613-md-arm64-drivers-clk-versatile-v1-1-6b8a5e5e00ef@quicinc.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 18 Jun 2024 12:22:45 +0200
Message-ID: <CACRpkdYmG=M717a0gmOmz2EtZY-AcxO+_a9Pcaicwq_iVNr2Hg@mail.gmail.com>
Subject: Re: [PATCH] clk: vexpress-osc: add missing MODULE_DESCRIPTION() macro
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 13, 2024 at 11:55=E2=80=AFPM Jeff Johnson <quic_jjohnson@quicin=
c.com> wrote:

> With ARCH=3Darm64, make allmodconfig && make W=3D1 C=3D1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/versatile/c=
lk-vexpress-osc.o
>
> Add the missing invocation of the MODULE_DESCRIPTION() macro.
>
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
