From: Markus Elfring <Markus.Elfring@web.de>
Date: Mon, 14 Jan 2019 07:40:17 +0000
Subject: Generating identifiers similar to UUIDs but without dashes
Message-Id: <c7463786-82f1-01c8-7f47-e784f2602209@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org
Cc: linux-crypto@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

Hello,

The file “/proc/sys/kernel/random/uuid” provides a bit of useful data.
The formal definition of the string representation for universally unique
identifiers requires the use of four dashes for the concatenation of fields.
https://tools.ietf.org/html/rfc4122#page-4
https://stackoverflow.com/questions/24481801/is-uuid-without-dashes-hyphens-valid#answer-24484051

Now I am looking again for possibilities to generate reasonably unique
identifiers also without these dashes.
Can any data processing benefit from the avoidance of such extra characters?

Regards,
Markus
