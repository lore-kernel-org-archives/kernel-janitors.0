From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 17 Oct 2017 09:11:20 +0000
Subject: Re: [PATCH 4/4] char/snsc: Delete unnecessary braces in five functions
Message-Id: <e713a84d-ea1d-0623-d45d-d1cdc52583d9@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cbedda27-97e7-7b11-b888-39e09f7deaa1@users.sourceforge.net>
 <f9000a51-3629-bb5e-efd2-048200543793@users.sourceforge.net>
 <20171017084919.oa462je5y45otrw7@mwanda>
In-Reply-To: <20171017084919.oa462je5y45otrw7@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <dan.carpenter@oracle.com>, linux-doc@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, LKML <linux-kernel@vger.kernel.org>

>>  		/* ...or if we want to block, then do so here */
>> -		if (down_interruptible(&sd->sd_wbs)) {
>> +		if (down_interruptible(&sd->sd_wbs))
>>  			/* something went wrong with wait */
>>  			return -ERESTARTSYS;
>> -		}
>>  	}
> 
> Multi-line indents get parenthesis.

How do you think about to add such an expectation to the section
“3) Placing Braces and Spaces” in the document “coding-style.rst”?

Regards,
Markus
