From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Fri, 19 Oct 2018 23:00:54 +0000
Subject: Re: [PATCH 3/3] scsi: myrs: prevent negatives in disable_enclosure_messages_store()
Message-Id: <yq1a7n9ilsp.fsf@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181019091909.a22ah7wybj6agqch@kili.mountain>
In-Reply-To: <20181019091909.a22ah7wybj6agqch@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Dan,

> We only want the value to be zero or one.
>
> It's not a big deal, but say we passed set value to INT_MIN, then
> disable_enclosure_messages_show() would return that 12 bytes of "buf"
> are initialized but actually only 3 are.  I think there are tools like
> KASAN which will trigger an info leak warning when that happens.

s/kstrtoint/kstrtouint/?

-- 
Martin K. Petersen	Oracle Linux Engineering
