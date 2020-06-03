From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 03 Jun 2020 19:30:09 +0000
Subject: Re: [PATCH] dm zoned: Fix memory leak of newly allocated zone on xa_insert failure
Message-Id: <6ae5a0f1-68d3-a0f9-e7f0-5c9f008204a8@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Colin Ian King <colin.king@canonical.com>, dm-devel@redhat.com
Cc: Alasdair Kergon <agk@redhat.com>, Damien Le Moal <damien.lemoal@wdc.com>, Hannes Reinecke <hare@suse.de>, Mike Snitzer <snitzer@redhat.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

> Currently if an xa_insert fails then there is a memory lead of the
> recently allocated zone object. =E2=80=A6

I hope that a typo will be avoided for the final change description.

Regards,
Markus
