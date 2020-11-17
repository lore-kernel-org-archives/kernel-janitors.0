From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Tue, 17 Nov 2020 03:58:45 +0000
Subject: Re: [PATCH] scsi: sd: remove obsolete variable in sd_remove()
Message-Id: <yq14klo63ee.fsf@ca-mkp.ca.oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201116070035.11870-1-lukas.bulwahn@gmail.com>
        <yq1ft5863ku.fsf@ca-mkp.ca.oracle.com>
In-Reply-To: <yq1ft5863ku.fsf@ca-mkp.ca.oracle.com> (Martin K. Petersen's
        message of "Mon, 16 Nov 2020 22:54:16 -0500")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Christoph Hellwig <hch@lst.de>, Hannes Reinecke <hare@suse.de>, "James E . J . Bottomley" <jejb@linux.ibm.com>, linux-scsi@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Tom Rix <trix@redhat.com>, Nathan Chancellor <natechancellor@gmail.com>, Nick Desaulniers <ndesaulniers@google.com>, clang-built-linux@googlegroups.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


>> Commit 140ea3bbf39a ("sd: use __register_blkdev to avoid a modprobe
>> for an unregistered dev_t") removed blk_register_region(devt, ...) in
>> sd_remove() and since then, devt is unused in sd_remove().
>
> Applied to 5.11/scsi-staging, thanks!

Actually, this should go through block given the dependency on the
commit above.

Acked-by: Martin K. Petersen <martin.petersen@oracle.com>

-- 
Martin K. Petersen	Oracle Linux Engineering
