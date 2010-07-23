From: walter harms <wharms@bfs.de>
Date: Fri, 23 Jul 2010 16:11:04 +0000
Subject: Re: [patch -next] ath5k: snprintf() returns largish values
Message-Id: <4C49BF18.4040106@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100722085202.GV17585@bicker> <201007231744.14922.br1@einfach.org>
In-Reply-To: <201007231744.14922.br1@einfach.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bruno Randolf <br1@einfach.org>
Cc: Dan Carpenter <error27@gmail.com>, "Luis R. Rodriguez" <lrodriguez@atheros.com>, Nick Kossifidis <mickflemm@gmail.com>, Jiri Slaby <jirislaby@gmail.com>, Bob Copeland <me@bobcopeland.com>, "John W. Linville" <linville@tuxdriver.com>, linux-wireless@vger.kernel.org, ath5k-devel@lists.ath5k.org, kernel-janitors@vger.kernel.org



Bruno Randolf schrieb:

>>
>> @@ -766,6 +781,9 @@ static ssize_t read_file_queue(struct file *file, char
>> __user *user_buf, len += snprintf(buf+len, sizeof(buf)-len, "  len: %d\n",
>> n);
>>  	}
>>
>> +	if (len > sizeof(buf))
>> +		len = sizeof(buf);
>> +
>>  	return simple_read_from_buffer(user_buf, count, ppos, buf, len);
>>  }
> 
> i think it would be better to make sure the buffer is always big enough to 
> hold all the output (it's not very variable in length), but as a safety net 
> this can't hurt.
> 


glibc provides open_memstream()/fmemopen() to write into large buffers.
I feel this as a better way than  len += snprintf(buf+len)

re,
 wh
