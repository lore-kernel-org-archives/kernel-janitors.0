From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 09 Sep 2018 11:13:25 +0000
Subject: Re: [PATCH RFC 3/5] coccinelle: add xxxsetbitsXX converting spatch
Message-Id: <463dbbdc-7afc-bee8-8da1-bbe70b4aec26@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1536349307-20714-4-git-send-email-clabbe@baylibre.com>
In-Reply-To: <1536349307-20714-4-git-send-email-clabbe@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: linus-amlogic@lists.infradead.org

How do you think about to add any more meta-data for this semantic patch script?

* SPDX identifier
* Copyright information
* Confidence level

https://bottest.wiki.kernel.org/coccicheck


> +virtual context

Further variables will be needed if you would like to use corresponding
operation modes (besides “patch”).


> +expression reg;
> +expression set;
> +expression clear;

I propose once more to avoid the repetition of (unnecessary) SmPL code.
This part could be written like the following instead.

+expression clear, set, reg;


If you would increase the usage of SmPL disjunctions, the specification
of duplicate SmPL code could be reduced considerably.

* Would you like to merge SmPL rules based on the distinction between
  the data types “u32” and “u64”?

* Did you identify any optional code in this transformation approach?


> +@@
> +expression base;
> +expression offset;
> +expression value;
> +@@
> +
> +- mtu3_setbits(base, offset, value);
> ++ setbits32(base + offset, value);
> +
> +@@
> +expression base;
> +expression offset;
> +expression mask;
> +@@
> +
> +- mtu3_clrbits(base, offset, mask);
> ++ clrbits32(base + offset, mask);

Another update suggestion:

+@replacement@
+expression base, offset;
+@@
+(
+-mtu3_clrbits
++clrbits32
+|
+-mtu3_setbits
++setbits32
+)(base
+-     ,
++ +
+  offset, ...);


Would you like to try further software fine-tuning out?

Regards,
Markus
