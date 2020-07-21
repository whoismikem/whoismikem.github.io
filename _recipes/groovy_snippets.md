---
name: Groovy Snippets
---

# Groovy Snippets

## Random Number between 0 and 10 
```groovy
Math.abs(new Random().nextInt() % 10) + 1
```

## Check for trailing '/' in path
```groovy
def check_trailing_slash(path) {
    return path.endsWith("/") ? path : path + "/";
}
```
