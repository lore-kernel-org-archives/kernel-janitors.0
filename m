From: Suzuki K Poulose <suzuki.poulose@arm.com>
Date: Thu, 13 Jun 2019 10:08:10 +0000
Subject: Re: [bug report] coresight: etm: Clean up device specific data
Message-Id: <fda21251-6ab9-aba6-9358-b2718682d21a@arm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190613065518.GD16334@mwanda>
In-Reply-To: <20190613065518.GD16334@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Dan

On 13/06/2019 07:55, Dan Carpenter wrote:
> Hello Suzuki K Poulose,
> 
> This is a semi-automatic email about new static checker warnings.
> 
> The patch 21d26b905c05: "coresight: etm: Clean up device specific
> data" from May 22, 2019, leads to the following Smatch complaint:
> 
>      ./drivers/hwtracing/coresight/coresight-etm3x.c:460 etm_get_trace_id()
>      warn: variable dereferenced before check 'drvdata' (see line 458)
> 
> ./drivers/hwtracing/coresight/coresight-etm3x.c
>     457		int trace_id = -1;
>     458		struct device *etm_dev = drvdata->csdev->dev.parent;
>                                           ^^^^^^^^^
> New dereference
> 
>     459	
>     460		if (!drvdata)
>                      ^^^^^^^^
> Checked too late.  Delete the check?
> 
>     461			goto out;
>     462	
> 

Thanks for the report. I have sent a patch to fix it.

Cheers
Suzuki
