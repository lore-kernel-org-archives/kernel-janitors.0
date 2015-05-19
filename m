From: Wim de With <nauxuron@wimdewith.com>
Date: Tue, 19 May 2015 13:22:09 +0000
Subject: Breaking lines in function headers
Message-Id: <555B3901.3090707@wimdewith.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

What is the correct way to break lines in a function header? The coding
style guide is not very clear about it. For example:

1.
static struct very_long_struct_name
*do_something_interesting(struct *another_long_struct_name)

2.
static struct very_long_struct_name *do_something_interesting(
				struct *another_long_struct_name)

Which one of these is the correct way to do it? I see the second one
used more often, and the coding style guide states "Descendants are
always substantially shorter than the parent and are placed
substantially to the right. The same applies to function headers with a
long argument list.", so I am inclined to say it is the correct way of
doing it. But if it is, how many tabs should I use? How should I align
the arguments if the list is longer, and I need more line breaks?

Thanks

Wim


