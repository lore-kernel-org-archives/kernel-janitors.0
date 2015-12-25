From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 25 Dec 2015 10:35:29 +0000
Subject: ACPI-fan: Another source code review around null pointer handling?
Message-Id: <567D1BF1.6060701@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
In-Reply-To: <566ABCD9.1060404@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: linux-acpi@vger.kernel.org, Len Brown <lenb@kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

Hello,

I have looked at the source file for the ACPI fan driver once more.
I would appreciate if a specific implementation detail can be clarified the=
re.

Static source code analysis can point out that functions like the following
share an approach for error detection and corresponding exception handling.
* acpi_fan_get_fif
* acpi_fan_get_fps
* fan_get_state_acpi4
https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/tree/drive=
rs/acpi/fan.c?id=80c75a0f1d81922bf322c0634d1e1a15825a89e6#n107

Can it matter eventually to handle a detected null pointer differently from
further checks for an attribute like "obj->type" or "obj->package"?

Regards,
Markus
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
