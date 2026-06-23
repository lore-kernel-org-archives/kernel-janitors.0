Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7573D3CAE68
	for <kernel-janitors@vger.kernel.org>; Tue, 23 Jun 2026 08:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782202403; cv=none; b=bDiec2EB7kY1VQEVhlpfdgUh0vyhBQgSRiQWHq6F6UQZakAYctp62CqEiziepu+8MIlbnsSTnP2g3X2VcYA0dkMnL7MsPfkr9ikx0ORHaWxvwYunKzT4NhpmnbbTBoRFkyUbX2/C5Nvf6mlNfgMGdV5wZ9AcSJGUjRDpTJHxuPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782202403; c=relaxed/simple;
	bh=P3zkQ6XgzYgXsHEgx6qPcSJ5cAhQqGRNFMvwsdKupso=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uj7P+cREIqPFZTkOyNCpxTEfDy8ANzMlr0aK2JFm5YB+5ZJuSyvQ4r1fLA+tARHwvZUFmGJsUqC5l1NKHn5li4R1ykuUr7UAJ7PVXMMxCHWVser4NC3iI0UMOnMqqzIiOzRXKpWZ6l3YzBC6tXBrAXJdWziwfjSqmBNCDoqGsUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i22zbFRS; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i22zbFRS"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c0bce8840b6so397475566b.2
        for <kernel-janitors@vger.kernel.org>; Tue, 23 Jun 2026 01:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782202401; x=1782807201; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+TIRRzOP5f40W2P6qE1IkeX7ZWgsBW+lVzgic3aztgQ=;
        b=i22zbFRSMinIKPpuirPi7VtkkK/YWHu2wKZ+3LfqeTQcjvKaBzvHWCGNqkt9suuR4p
         XjGi9OAyJbl+XyBpK7ttMW9d8RJ9LbC16684e10dSCebfj16ULGca7RuGplIJ/TS94Zb
         YNuyqL2ju/Z3fudyTq+M5sW6LfRvR4R63E8p+NP0RVsaQErBCoZcJ8evJ2raTCmfx0N4
         2trMDSkl4g9LHS2gcyVzMOOmfxibxy5fSzdbyCuT6ggTHwKmKsYZHwm6A6OiMNTvPN+U
         VkV7d8362IYGLq7PM7TFmQ0y+2QnRJXlkJ3Twk/lGyGg741iy9Q8dGw3OAVm2IlTfTOw
         Z+0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782202401; x=1782807201;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+TIRRzOP5f40W2P6qE1IkeX7ZWgsBW+lVzgic3aztgQ=;
        b=ExB467ed1rmUrQN62TlWMxfgMzrQavcy/iJ6YHZrMgsKZooWYB+5vy2YoHMhUiawjN
         XjwtRdj39ytagt3/4ycQShOliktTKH9MprHTcWNYIulfQMR7W8JDuBIfxZd7P3/QKlaP
         Zv43pMNlETpn2iP6TJwxNQMVh9N/T99qCoFF0L+asC/GV/98SXwWnCaJdKldrCY63OBC
         LsBcV8mu71jXHVWQxZNuniGz3vyDsiTd3oGkM2dSPv503UZ2XZIdP0F0dp6DpLyLJY1J
         RA0HWFYLx444gNxXzvIS2RKneR6oXeb/05CY+1l2jwRHXU2dx/5jDeN93XhkHaiL6hWq
         qbOA==
X-Forwarded-Encrypted: i=1; AFNElJ8JVdueczg4rJtuiAan+pVaOB5xsDMPHQZO5EtWz7FIEQqo6WnfWvZnt55IAyVCbvr41/jNnPnyJn06CZy7JXI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLRp989g+ho926wL415S3eY+zsgB/HMCxFv83HBvsbQT0jjaHO
	cfBHcXV7hiQLv3HpS2D+90eguE0bb0gt/g0P62C7GWEgHlkjJ7E3Hjl7
X-Gm-Gg: AfdE7cnuigD8q5pR4D97q7AKivFJwni1AXjR7RYK/YlXfqLw9bf6DBFoP1XBJuZq3Wo
	NBRbVs1ks5DzgyvHMi5QbH/VsYUqeTrhSeV47lBkn4JDClkyzMhqFkJGpumN/j9nbDWQkBuRxFh
	9Gjz3nxitVkWfvI0y2zDAwg7m2JltntVjeBqA9SXqZ3EVKfiqTsOj2fye7N4F7LS+FIDvm9bgeA
	5fK9dxpIzsGRXjQM9hmu3HSl7mKwqYQ9dlpyXAA64P09R3k7QDOvhHomFb7bg9dY88FU+1KoqO8
	EsoRCXRJhfftKHpieSlIk42BtcwKY9GKgjd+TM6gG3DIwnM2jb+xrEl/Vvtgn8oKIjF791y1qX4
	693UXCKUFoth6W1n6J4Q3Za3ChwO9sDMFr9JzhtDCxfdgBIexdzg4OMptLGFyocnX6hjJE6P5Bw
	12KNwcf98G
X-Received: by 2002:a17:907:78e:b0:bb8:b593:edba with SMTP id a640c23a62f3a-c097ccc02eemr928113566b.38.1782202400801;
        Tue, 23 Jun 2026 01:13:20 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c610e12f6sm487614366b.47.2026.06.23.01.13.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 01:13:19 -0700 (PDT)
Date: Tue, 23 Jun 2026 11:13:16 +0300
From: Dan Carpenter <error27@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: Re: [PATCH] thermal/drivers/rcar: add error checking in probe()
Message-ID: <ajpAHMPdR3ty-N-n@stanley.mountain>
References: <ajo6iQ3VWvcxedA9@stanley.mountain>
 <CAMuHMdUXkXCj7ijeQmOkK7OQSAGkYgBZJyMJoEV4i_XhamwDSQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUXkXCj7ijeQmOkK7OQSAGkYgBZJyMJoEV4i_XhamwDSQ@mail.gmail.com>

Yeah, thanks Geert.  You're right.  I'll resend.

regards,
dan carpenter

