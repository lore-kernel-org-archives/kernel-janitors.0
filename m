Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0340F13F01A
	for <kernel-janitors@vger.kernel.org>; Fri, 26 Apr 2024 09:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714124334; cv=none; b=r+Upv+/S+E8+5LVPvihzVAxQ2GH9PVzdN6pIH/3sb4WF8duitDfy+06ZhnvTYxapWO3408kzc1WFyPe/nKHDSbOYoadjiwKGO8cnmklQZMBR/+EtuJ4BH6D7GJfiXVZ9oIpF1BhYTW2+q4Svhu80AnqYNOZfK0+tZzxgpJ8QSNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714124334; c=relaxed/simple;
	bh=PuFTf1AFlRWPLS/KPnaj9eb2KIiGnxPhqAOjpFztONc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=duVYqWLuxCGn8omwDYfd8+dftqf3DeYCnDkCGnqym5DLNyrOwdIDBYEjB54WlYZKPZ9dVzMn/e2h92Tccvyw9haOoFdTO8IiDvo6TdtrmYmolKD7qZ0jU5QgerHJP5trBSEIzgwP025zjIyf/1kTTKB5ABWy8TVQoy5QJ6/a3h8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Y1PtMS6a; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y1PtMS6a"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3499f1bed15so1772910f8f.1
        for <kernel-janitors@vger.kernel.org>; Fri, 26 Apr 2024 02:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714124331; x=1714729131; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9nIVCK79GHj0GYtUEHyinljVAWRX71EOlK/nPokKfxM=;
        b=Y1PtMS6aI+m+ST5J/EIkvPOg5HQJaWetSytwZWW4dO2tsyGQ7nshRqK9YaZp+lprA7
         K9PZaA+gkky489YaojQxkDR+NfgcRA5S711nflsCHPnesexlw7GcsSPB4inoZznkY7fM
         JPFT1uCqUR01onwR4sydDX05Yl7O0Vb5Uud70GUyOMd8WpQCl62GyVYs/xbHjC42eDZ4
         ugBZ7FpzUylLyuoVwBAJ4A86oaJByszHC+VWX67qhOpg3Ls4imMsG88nmYEv2V+A1XgR
         2y1NddoDClDjkAS4UrJgvy016rVArizBNMNgOoCidfT1+d9P3u9+nE7bWxFEL/X5myBC
         nRQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714124331; x=1714729131;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9nIVCK79GHj0GYtUEHyinljVAWRX71EOlK/nPokKfxM=;
        b=h27t0QjukAfBk3YiRqJxGzxJVerZ4AQETFnWfTTHL9ctnUOCSFN6o/P7IhSXUux8H0
         j6i4bnLJ3H8ShNNKNop7oY7ExkAQ9jE94hYuCrq8MAx9i7V5yZyUxjkoqS6qtfaPS8QK
         yuMe8BghiOwl/wF253xuzI8JKvqlK7xL2p8lUiCrAzzJUbRDgcBndgJLV4MY7GhX9Rli
         XlQoH83/4YPxP/n0TKxBTeM1UUbU9ceuMJSqSt6Qnj79Ntxi6C20+UXWaIGDNoxu0/rQ
         c9e078e4l7b1lNi1niT2QEMvArZ/NIWZFsSdBNo8oIeRyP+8sjUIOG/zHOuCQR2SEbqE
         Pg1w==
X-Forwarded-Encrypted: i=1; AJvYcCUuZb8efg3OCJBsMBCOmYrAbTRUCctMHKzTG2n6LwxOe1WcnQyNLUb0Tam1dXo9ntBCrMNhYRvMM2uGpeYA2Bn/S5lKQteWqSlVmp4FTF87
X-Gm-Message-State: AOJu0YyYi/f4gpQ1J1b9GVN53GJsKxCgwFQFD1+kyyeHv0ma5vAmV3JI
	kekyy6T/2tT0n3RXWdCn1khSiZNzIl0XKAL13xbCIpd2JnPVZKtf8O99UP9Qv58=
X-Google-Smtp-Source: AGHT+IFyrLVXYhZdFZZ13tOyusYkBJr5UHYai5KWEBZnmnl5mj33KLQmr+8FZdbnGnNZCINzO1P/6Q==
X-Received: by 2002:a5d:5f53:0:b0:346:f935:e828 with SMTP id cm19-20020a5d5f53000000b00346f935e828mr2505531wrb.5.1714124331106;
        Fri, 26 Apr 2024 02:38:51 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id z4-20020adff744000000b00343bd6716b3sm21932964wrp.99.2024.04.26.02.38.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 02:38:50 -0700 (PDT)
Date: Fri, 26 Apr 2024 12:38:47 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sungwoo Kim <iam@sung-woo.kim>
Cc: Markus Elfring <Markus.Elfring@web.de>, linux-bluetooth@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	"Dave (Jing) Tian" <daveti@purdue.edu>,
	Johan Hedberg <johan.hedberg@gmail.com>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Marcel Holtmann <marcel@holtmann.org>
Subject: Re: [PATCH] Bluetooth: L2CAP: Fix slab-use-after-free in
 l2cap_send_cmd
Message-ID: <dd466a68-f3ae-4dc1-8389-6adc463735db@moroto.mountain>
References: <20240426072006.358802-1-iam@sung-woo.kim>
 <964b0005-3a9d-499b-91d3-171a3c917b4a@web.de>
 <CAJNyHp+WFONaNbZVK3tPcT=9obEiuE3MvQzJK++HP-ffNdfX0w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJNyHp+WFONaNbZVK3tPcT=9obEiuE3MvQzJK++HP-ffNdfX0w@mail.gmail.com>

Please just ignore Markus.  A lot of people have asked him to stop
commenting on commit messages but he doesn't listen.  Here is a message
from yesterday:

https://lore.kernel.org/all/2024042547-shimmy-guileless-c7f2@gregkh/

1) It doesn't matter at all if there is anyone in the To: header.
2) You are allowed to ask questions.
3) Yes, the commit message will need to be changed but first fix the bug
   and then we can worry about the commit message.

regards,
dan carpenter

