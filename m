From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Wed, 31 Aug 2016 02:23:34 +0000
Subject: Re: [PATCH] megaraid_sas: Fix the search of first memory bar
Message-Id: <yq1lgzd7k2h.fsf@sermon.lab.mkp.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1471768105-14730-1-git-send-email-christophe.jaillet@wanadoo.fr>
In-Reply-To: <1471768105-14730-1-git-send-email-christophe.jaillet@wanadoo.fr>
        (Christophe JAILLET's message of "Sun, 21 Aug 2016 10:28:25 +0200")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: kashyap.desai@avagotech.com, sumit.saxena@avagotech.com, uday.lingala@avagotech.com, jejb@linux.vnet.ibm.com, martin.petersen@oracle.com, megaraidlinux.pdl@avagotech.com, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

>>>>> "Christophe" = Christophe JAILLET <christophe.jaillet@wanadoo.fr> writes:

Christophe> The 2nd parameter of 'find_first_bit' is the number of bits
Christophe> to search.  In this case, we are passing 'sizeof(unsigned
Christophe> long)' which is likely to be 4.

Christophe> It is likely that the number of bits in a long was expected
Christophe> here, so use BITS_PER_LONG instead.

Applied to 4.9/scsi-queue.

-- 
Martin K. Petersen	Oracle Linux Engineering
