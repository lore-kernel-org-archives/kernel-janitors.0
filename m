From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 23 Oct 2017 09:10:29 +0000
Subject: Re: ARM: mvebu: Use common error handling code in mvebu_armada_pm_init()
Message-Id: <44577789-a2e8-4c1a-9abc-a34a17ae2e22@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1c378b21-f10a-3a3a-fcee-8f0c0214a8fe@users.sourceforge.net>
 <20171023085718.lga7auriq7paw2hv@mwanda>
In-Reply-To: <20171023085718.lga7auriq7paw2hv@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: linux-arm-kernel@lists.infradead.org

> The error handling in mvebu_armada_pm_init() is incomplete

How would you like to extend it?


> and this patch just smudges it around without fixing anything.

How does this kind of feedback fit to information from the section
“7) Centralized exiting of functions” in the document “coding-style.rst”?

Regards,
Markus
