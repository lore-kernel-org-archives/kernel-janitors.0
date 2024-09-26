Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47CAE1607AC
	for <kernel-janitors@vger.kernel.org>; Thu, 26 Sep 2024 12:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727353231; cv=none; b=tQcVZUcgg7MUs3Lzb2Gt9D7rd9zjJsXqbb9TRgPtI/4V45Wx3aizzaK8mCAA35ObyJ+J8r/6VOBuv+2g47mU2gvGIAmLqpfItYp3i0L1K8RZdhHUzclJXubw+y24gBNGcgZA1DFZHSOCguACAhhP/5oXLUblNuiMlM3z+Tu7Q18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727353231; c=relaxed/simple;
	bh=vOTpzB5vd/CwIsuye/jBaiRBDbMI1JUdjxFFIctmwEQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MV+FDqIVJl/51XeqXTsm1IL8ts4CsRIbASgOMSw4jmgFqedfVvbAxEaa74u6Cvk/MMqW8nyULiv3Td6HtZcS5Wm7RiRSoiphe4HRcpQyApMESI0hLyDl1ad3uemS6xfMEimhsBW5tTZ50/G7KTLFyxHktEE4Z+q2wwd7U6gfdvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JOjTuC4P; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JOjTuC4P"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6e232e260c2so5574427b3.0
        for <kernel-janitors@vger.kernel.org>; Thu, 26 Sep 2024 05:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727353229; x=1727958029; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/chIijZxfaJZTmXeHsE7W1Ywlan6j7i6j6yboptQjwE=;
        b=JOjTuC4Pg3j/gHHx9Uy+VfdebUOaxqcoEbibnDgwFfk9/CpyX6esgGmH9oHWNriWwZ
         tpYwRVh+cYtx2TxWAEoZBuHlgurVXYQ0HlAq4VhmWRqX1VYj/aqJc40inEZ8SAG5bh2e
         sCZT+gmzPRTfee6eXi2UwDxZpjR+V5SBJXPOdWwqSadizel+jfiPCzgpZGrjB6TmRiGo
         h7C3KicEWiDV4NQWpqBnGU1POP07aw5T+J7sBu47ZTMsLSkZZPvH0bXsSHUjh2cSGgqL
         XCbQ2+brdwq9U66sbzQIF9Gk6kQskpCsfxScVeGw80LPW9oV8JNNK04ZUm+G9pXlTnUA
         pMyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727353229; x=1727958029;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/chIijZxfaJZTmXeHsE7W1Ywlan6j7i6j6yboptQjwE=;
        b=ZTUf6hQxLKZd2v9oCGndiSXo35QepL/yFYbmMNoYwSxWPofRZZAGcskL/SwCbRFAZU
         xDhFbznrAxJ39OX3PVbTpsxRPhM96A/0WYBYnLf9CdKGzA6Esex8U/Yb4lMpl2jK95F6
         GtQULQwmWK6HxUUWZs9PI9JvmzIx3AX9JKgkWmprWa4jk+OrQ9+zq8yVkrAbHLG7Fzpm
         I+Fo5dsYB33RvwskqV+fHZ1y6ZDyG1Ju5xw5W4S8aFnYGgn9COdvdwP3becdd5d3lSjb
         JgnxVteLoynAKkwHh3DNF8aoLaUS2gzR1iaBCrtJ8xUPIlwRiGenMqjNREUnFMNLXmjh
         b1Ew==
X-Forwarded-Encrypted: i=1; AJvYcCUggF3+A+da46EYnGsqGnXU1893HFTRN9u2TcZ/gFYSEf4fPL2dVsNT6vcTTRabN8UnD5CTUDZeEE9uJMCpMKY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyv1vZPyf3hBZXRvAq3fZPcM9nqAku5DsVJuRDx0YZaEppy0Rsi
	Jmv1WU0cw4k6wy0MHKzRrXsd6Ur74nlDyccOIanbdX0PQByCCsKo2hq8UyfAl2R6Z7aMutlyvu0
	sUZsVCtJz3/e6vCEuOkVemgttKez2WwL5sp7DUQ==
X-Google-Smtp-Source: AGHT+IFYe6avJXcb20Z3oY/wCbFOgqRRn6CzbS+mU2MwuBkHglhoEJHCWq1HMAvQiZOvmabxdtU+nRUUoxytEl305oc=
X-Received: by 2002:a05:690c:5c03:b0:6b5:5042:2c9d with SMTP id
 00721157ae682-6e21d848317mr47670397b3.24.1727353229221; Thu, 26 Sep 2024
 05:20:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <b890361e-e99b-43da-8571-7478b5eab475@web.de> <jjsbnitbajdw7dc4plkbb55ezl2cdbnrfws7hnoigbzasvdzua@puhrwwlu4lvv>
 <ZvVPlInCFajkeFy9@smile.fi.intel.com>
In-Reply-To: <ZvVPlInCFajkeFy9@smile.fi.intel.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 26 Sep 2024 14:20:19 +0200
Message-ID: <CAA8EJpo0Q0Wn-GzqmPeNFfG_Hr-o8E7F_VuO47EbxKx=0OQhyQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] usb: typec: ucsi: ccg: Adjustments for common code in
 two functions
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Markus Elfring <Markus.Elfring@web.de>, linux-usb@vger.kernel.org, 
	Ajay Gupta <ajayg@nvidia.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Haotien Hsu <haotienh@nvidia.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Utkarsh Patel <utkarsh.h.patel@intel.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Wolfram Sang <wsa@the-dreams.de>, LKML <linux-kernel@vger.kernel.org>, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 26 Sept 2024 at 14:12, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Sep 26, 2024 at 12:26:24AM +0300, Dmitry Baryshkov wrote:
> > On Wed, Sep 25, 2024 at 07:31:04PM GMT, Markus Elfring wrote:
> > > From: Markus Elfring <elfring@users.sourceforge.net>
> > > Date: Wed, 25 Sep 2024 19:19:01 +0200
> > >
> > > A few update suggestions were taken into account
> > > from static source code analysis.
> > >
> > > Markus Elfring (2):
> > >   Use common code in ccg_write()
> > >   Use common code in ccg_read()
> > >
> > >  drivers/usb/typec/ucsi/ucsi_ccg.c | 15 ++++++++-------
> > >  1 file changed, 8 insertions(+), 7 deletions(-)
> >
> > For the series:
> >
> > Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> I believe there is no-one to take it,

I guessed so.

> but in any case the thing is that kfree()
> probably can be done using __free(). Then PM runtime handled differently.

That's a separate cleanup in my opinion.

-- 
With best wishes
Dmitry
