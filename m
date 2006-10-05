From: Don Mullis <dwm@meer.net>
Date: Thu, 05 Oct 2006 07:08:38 +0000
Subject: Re: [KJ] [PATCH] Kconfig refactoring for better menu nesting
Message-Id: <1160032118.7669.10.camel@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1159944763.7669.6.camel@localhost.localdomain>
In-Reply-To: <1159944763.7669.6.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


> I'm not sure about the semantics of "depends on" but in boolean logic:
> 
> (!ACPI_DOCK && ACPI) || (ACPI_DOCK) = (!ACPI_DOCK || ACPI_DOCK) && (ACPI || ACPI_DOCK)
> 
> = (true) && (ACPI || ACPI_DOCK)
> = ACPI || ACPI_DOCK
> 
> Is there something about "depends on" that would make the far simpler expression incorrect?

Your simplification looks good to me.

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
