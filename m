From: Jan Engelhardt <jengelh@computergmbh.de>
Date: Fri, 27 Jul 2007 10:50:13 +0000
Subject: Re: [PATCH 02/68] 0 -> NULL, for arch/arm
Message-Id: <Pine.LNX.4.64.0707271250020.12711@fbirervta.pbzchgretzou.qr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200707270944.LAA17082@ifs.emn.fr> <20070727095905.GU27237@ftp.linux.org.uk>
In-Reply-To: <20070727095905.GU27237@ftp.linux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Al Viro <viro@ftp.linux.org.uk>
Cc: Yoann Padioleau <padator@wanadoo.fr>, kernel-janitors@vger.kernel.org, rmk@arm.linux.org.uk, akpm@linux-foundation.org, linux-kernel@vger.kernel.org


On Jul 27 2007 10:59, Al Viro wrote:
>On Fri, Jul 27, 2007 at 11:44:07AM +0200, Yoann Padioleau wrote:
>>  		buf = alloc_safe_buffer(device_info, ptr, size, dir);
>> -		if (buf = 0) {
>> +		if (buf = NULL) {
>
>		if (!buf)
>surely...

Makes it look like it's used as a bool.


	Jan
-- 
