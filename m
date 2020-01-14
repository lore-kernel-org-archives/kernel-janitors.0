From: Martin Lau <kafai@fb.com>
Date: Tue, 14 Jan 2020 00:32:35 +0000
Subject: Re: [bug report] bpf: Introduce BPF_MAP_TYPE_STRUCT_OPS
Message-Id: <20200114003232.pmpq3i4jwgfoi6n7@kafai-mbp.dhcp.thefacebook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200113130617.7ecdrglwlmofhvrx@kili.mountain>
In-Reply-To: <20200113130617.7ecdrglwlmofhvrx@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Jan 13, 2020 at 04:06:17PM +0300, Dan Carpenter wrote:
> Hello Martin KaFai Lau,
> 
> The patch 85d33df357b6: "bpf: Introduce BPF_MAP_TYPE_STRUCT_OPS" from
> Jan 8, 2020, leads to the following static checker warning:
> 
> 	kernel/bpf/bpf_struct_ops.c:501 bpf_struct_ops_map_seq_show_elem()
> 	warn: 'value' is an error pointer or valid
> 
> kernel/bpf/bpf_struct_ops.c
>    495  static void bpf_struct_ops_map_seq_show_elem(struct bpf_map *map, void *key,
>    496                                               struct seq_file *m)
>    497  {
>    498          void *value;
>    499  
>    500          value = bpf_struct_ops_map_lookup_elem(map, key);
>                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> This is just a dummy function that only returns -EINVAL.
Thanks for the report. I will post a fix.
