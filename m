From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Wed, 24 Oct 2018 02:28:01 +0000
Subject: Re: [PATCH 3/3] scsi: myrs: prevent negatives in disable_enclosure_messages_store()
Message-Id: <yq1k1m8f58u.fsf@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181019091909.a22ah7wybj6agqch@kili.mountain>
In-Reply-To: <20181019091909.a22ah7wybj6agqch@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Dan,

>> +	if (value < 0 || value > 2)
>>  		return -EINVAL;
>
> It's not actually clear to me why we allow 2.  Shouldn't we just use
> kstrtobool()?

Hannes?

-- 
Martin K. Petersen	Oracle Linux Engineering
