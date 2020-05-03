From: Markus Elfring <Markus.Elfring@web.de>
Date: Sun, 03 May 2020 14:54:45 +0000
Subject: Re: [PATCH v5] checkpatch: add support to check 'Fixes:' tag format
Message-Id: <1abe0267-7c2a-53a1-bda2-469ef681d469@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200503122938.GC10332@udknight>
 <2d13b5c1-6745-23da-e22d-d56f0644edb2@web.de>
 <20200503143700.GA12276@udknight>
In-Reply-To: <20200503143700.GA12276@udknight>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wang YanQing <udknight@gmail.com>, Joe Perches <joe@perches.com>, Andy Whitcroft <apw@canonical.com>, kernel-janitors@vger.kernel.org, linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Alexei Starovoitov <alexei.starovoitov@gmail.com>, Matteo Croce <mcroce@redhat.com>

>>> +				      "Please use git commit description style '$prefix <$sha1_length_min+ chars of sha1> (\"<$title>\")' - ie: '${init_char}" . substr($prefix, 1) .
>>> +				      " $id (\"$description\")'\n" . $diagnostics . $herecurr);
>>
>> Can error diagnostics become multi-line?
> The length of "$description" is unknown, it is difficult to
> cook the error message into pretty format with any length of
> "$description", so let's keep it in current way.

How do you think about a message variant like the following?

+				      "Please use git commit description style:\n$prefix <$sha1_length_min+ chars of sha1> (\"<$title>\")\n" . substr($prefix, 1)
+				      . "i. e.: '${init_char} $id (\"$description\")\n"
+				      . $diagnostics . $herecurr);


Regards,
Markus
