From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 21 Aug 2017 13:30:39 +0000
Subject: Re: btrfs: Delete an unnecessary variable initialisation in tree_mod_log_eb_copy()
Message-Id: <b487a820-20e4-8346-9196-654682c63b4e@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <360126ba-e45b-0a8d-57b6-83764c4c2bce@users.sourceforge.net>
 <31e6e888-586c-3480-7d57-dbf96989a26c@users.sourceforge.net>
 <CAGqmi75EiV4nX+QCv0GR9wRbjNS5d7UernMSBdHEVsA+ubGBaQ@mail.gmail.com>
In-Reply-To: <CAGqmi75EiV4nX+QCv0GR9wRbjNS5d7UernMSBdHEVsA+ubGBaQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Timofey Titovets <nefelim4ag@gmail.com>
Cc: linux-btrfs <linux-btrfs@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

> Don't needed, and you did miss several similar places (L573 & L895) in
> that file with explicit initialisation.

Would you like to adjust any remaining places in such source files?

Regards,
Markus
