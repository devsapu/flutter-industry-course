# Week 6 – Performance Optimization

**Branch:** `week-6`

## Learning Objectives

- Reduce unnecessary widget rebuilds
- Efficient list rendering
- Pagination
- Search with debouncing
- Basic caching strategies

## Teaching Flow

1. **Whiteboard:** When widgets rebuild; why long lists need optimization
2. **Live coding:**
   - Replace `ListView` of all items with `ListView.builder` (and itemCount)
   - Add pagination: load next page when user scrolls near the end
   - Add search: debounce (e.g. 300–500 ms) before calling API
3. **Debugging:** “Why is the whole list rebuilding?” – const widgets, keys, splitting widgets

## Repo Structure (Week 6)

Same as Week 5; additions in:

- Presentation: search field, pagination logic in provider/use case
- Data: API params for page and query, optional simple cache (e.g. in-memory)

## Key Concepts

- **ListView.builder** – builds only visible items
- **Pagination** – page index, “load more” on scroll
- **Debounce** – delay search request until user stops typing
- **Caching** – cache previous responses or pages to avoid redundant calls

## Student Exercises

- Implement “Load more” at the end of the list
- Add a search bar; debounce and filter (or call search API)
- Optional: cache the first page so it shows instantly on return

## Check Out This Week

```bash
git checkout week-6
cd task_manager_app && flutter pub get && flutter run
```
