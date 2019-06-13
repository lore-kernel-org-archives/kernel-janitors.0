From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 13 Jun 2019 06:55:18 +0000
Subject: [bug report] coresight: etm: Clean up device specific data
Message-Id: <20190613065518.GD16334@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Suzuki K Poulose,

This is a semi-automatic email about new static checker warnings.

The patch 21d26b905c05: "coresight: etm: Clean up device specific 
data" from May 22, 2019, leads to the following Smatch complaint:

    ./drivers/hwtracing/coresight/coresight-etm3x.c:460 etm_get_trace_id()
    warn: variable dereferenced before check 'drvdata' (see line 458)

./drivers/hwtracing/coresight/coresight-etm3x.c
   457		int trace_id = -1;
   458		struct device *etm_dev = drvdata->csdev->dev.parent;
                                         ^^^^^^^^^
New dereference

   459	
   460		if (!drvdata)
                    ^^^^^^^^
Checked too late.  Delete the check?

   461			goto out;
   462	

regards,
dan carpenter
