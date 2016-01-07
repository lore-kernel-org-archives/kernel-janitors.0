From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 07 Jan 2016 09:43:45 +0000
Subject: Re: [patch] MAINTAINERS: fix MIC maintainers entry
Message-Id: <20160107094345.GB5177@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160107094001.GE27186@mwanda>
In-Reply-To: <20160107094001.GE27186@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sudeep Dutt <sudeep.dutt@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>, Joe Perches <joe@perches.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>

I wrote some bash to find problems in MAINTAINERS.  I'm not sure what to
do with it.

# Grep for missing colons
for i in $(cut -b 1-2 MAINTAINERS | grep : | sort | uniq | cut -b 1) ; do
    egrep "^$i[ 	]" MAINTAINERS
done

# Grep for non-existing files
for i in $(grep ^F: MAINTAINERS | grep -v '\*' | cut -d : -f 2-) ; do
    if ! test -e $i ; then
        echo $i
    fi
done

regards,
dan carpenter
