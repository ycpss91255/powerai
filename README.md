# powerai

## Multiple gpu

```bash
$ vim utils/train.py
go to row 23
```

write

```python
device = torch.device('cuda')
model = nn.DataParallel(VoiceFilter(hp)).to(device)
```

config/config.yaml

```yaml
train:
  batch_size: 32 # Rule of thumb
  num_workers: 64 # Rule of thumb
```
docker: Error response from daemon: could not select device driver "" with capabilities: [[gpu]].

sudo systemctl restart docker
